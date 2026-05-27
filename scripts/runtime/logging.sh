#!/usr/bin/env bash
set -euo pipefail

brewme_uuid() {
  python3 - <<'PY'
import uuid
print(uuid.uuid4().hex)
PY
}

brewme_log_init() {
  local channel="$1"
  local component="$2"
  local path="${3:-}"

  brewme_log_channel="$channel"
  brewme_log_component="$component"
  brewme_log_run_id="${brewme_log_run_id:-$(brewme_uuid)}"
  brewme_log_repo_commit="${brewme_log_repo_commit:-$(git -C "$ROOT_DIR" rev-parse HEAD 2>/dev/null || printf unknown)}"
  brewme_log_entrypoint="${brewme_log_entrypoint:-$component}"
  brewme_log_env_profile="${brewme_log_env_profile:-${ENV_PROFILE:-unknown}}"
  if [[ "${channel}" == "tests" && -z "${brewme_test_run_id:-}" ]]; then
    brewme_test_run_id="$brewme_log_run_id"
  fi
  if [[ "${channel}" == "governance" && -z "${brewme_gate_run_id:-}" ]]; then
    brewme_gate_run_id="$brewme_log_run_id"
  fi
  if [[ -n "$path" ]]; then
    brewme_log_path="$path"
  else
    brewme_log_path="$ROOT_DIR/.runtime-cache/logs/${channel}/${brewme_log_run_id}.jsonl"
  fi
  mkdir -p "$(dirname "$brewme_log_path")"
}

brewme_log_json_only() {
  local severity="$1"
  local event="$2"
  shift 2
  local message="$*"
  local source_kind="${brewme_log_source_kind:-}"
  if [[ -z "$source_kind" ]]; then
    case "${brewme_log_channel:-}" in
      tests) source_kind="test" ;;
      governance) source_kind="governance" ;;
      infra) source_kind="infra" ;;
      upstreams) source_kind="upstream" ;;
      *) source_kind="app" ;;
    esac
  fi
  python3 "$ROOT_DIR/scripts/runtime/log_jsonl_event.py" \
    --path "${brewme_log_path:?}" \
    --run-id "${brewme_log_run_id:?}" \
    --trace-id "${brewme_trace_id:-}" \
    --request-id "${brewme_request_id:-${brewme_log_run_id:-}}" \
    --service "${brewme_log_service:-${brewme_log_component:?}}" \
    --component "${brewme_log_component:?}" \
    --channel "${brewme_log_channel:?}" \
    --source-kind "$source_kind" \
    --test-id "${brewme_test_id:-}" \
    --test-run-id "${brewme_test_run_id:-}" \
    --gate-run-id "${brewme_gate_run_id:-}" \
    --upstream-id "${brewme_upstream_id:-}" \
    --upstream-operation "${brewme_upstream_operation:-}" \
    --upstream-contract-surface "${brewme_upstream_contract_surface:-}" \
    --failure-class "${brewme_failure_class:-}" \
    --entrypoint "${brewme_log_entrypoint:-${brewme_log_component:?}}" \
    --env-profile "${brewme_log_env_profile:-unknown}" \
    --repo-commit "${brewme_log_repo_commit:-unknown}" \
    --event "$event" \
    --severity "$severity" \
    --message "$message" >/dev/null 2>&1 || true
}

brewme_log() {
  local severity="$1"
  local event="$2"
  shift 2
  local message="$*"
  printf '[%s] %s\n' "${brewme_log_component:-unknown_component}" "$message" >&2
  brewme_log_json_only "$severity" "$event" "$message"
}
