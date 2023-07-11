import { Tooltip } from "react-tooltip";
import Logo from "./logo";

function Menu(props) {
  const tooltipContent = props.data.menu
    .map((item) => {
      return `<button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 my-2 px-4 rounded">
    <a href="${item.url}">${item.title}</a></button>`;
    })
    .join("");

  return (
    <>
      <a
        data-tooltip-id="menu"
        data-tooltip-html={
          '<div class="flex flex-col">' + tooltipContent + "</div>"
        }
        data-tooltip-place="top"
      >
        <Logo data={props.data.hat} />
        <Tooltip id="menu" openOnClick={true} clickable />
      </a>
    </>
  );
}

export default Menu;
