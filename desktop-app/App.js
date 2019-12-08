import { Sidebar } from "./Sidebar.js";
import { chooseTab } from "./ChooseTab.js";

function App(wire) {
    wire()`
        <div class="container">
            <div class="row">
                ${Sidebar(wire)}
                <div class="col-sm-9 inset_info">
                    ${chooseTab(wire)}
                </div>
            </div>
        </div>`
}

export {
    App,
}