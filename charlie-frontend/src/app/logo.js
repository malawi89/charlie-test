import Image from "next/image";
import { Tooltip } from "react-tooltip";
import * as images from "./images";

function Logo(props) {
  const image = props.data.image;
  const message = props.data.message;

  if (image === "santa") {
    return (
      <a
        data-tooltip-id="event-tooltip"
        data-tooltip-content={props.data.message}
        data-tooltip-place="left"
      >
        <Image src={images.santa} alt="Charlie Logo" />
        <Tooltip id="event-tooltip" />
      </a>
    );
  }

  if (image === "witch") {
    return (
      <a
        data-tooltip-id="event-tooltip"
        data-tooltip-content={props.data.message}
        data-tooltip-place="left"
      >
        <Image src={images.witch} alt="Charlie Logo" />
        <Tooltip id="event-tooltip" />
      </a>
    );
  }

  if (image === "party") {
    return (
      <a
        data-tooltip-id="event-tooltip"
        data-tooltip-content={props.data.message}
        data-tooltip-place="left"
      >
        <Image src={images.party} alt="Charlie Logo" />
        <Tooltip id="event-tooltip" />
      </a>
    );
  }
  return <Image src={images.none} alt="Charlie Logo" />;
}

export default Logo;
