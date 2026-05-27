import "./index.css";
import { Composition } from "remotion";
import { BrewMeFrontDoor } from "./BrewMeFrontDoor";

export const RemotionRoot: React.FC = () => {
  return (
    <>
      <Composition
        id="BrewMeFrontDoor"
        component={BrewMeFrontDoor}
        durationInFrames={480}
        fps={30}
        width={1280}
        height={720}
        defaultProps={{
          title: "Start with one finished reading surface",
          subtitle:
            "Then inspect proof, search, and builder tools only when the reading path asks for them.",
        }}
      />
    </>
  );
};
