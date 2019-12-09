import { store, renderApp } from "./index.js";
import { tabName } from "./tabName.js";

function Sidebar(wire) {
    function selectInboxTab() {
        store.chnageTabName(tabName.INBOX);
        renderApp()
    }

    function selectTodayTab() {
        store.chnageTabName(tabName.TODAY);
        renderApp()
    }

    function selectUpcomingTab() {
        store.chnageTabName(tabName.UPCOMING);
        renderApp()
    }

    function selectAnytimeTab() {
        store.chnageTabName(tabName.ANYTIME);
        renderApp()
    }

    return wire()`
        <div class="col-sm-3 sidebar">
            <ul class="nav flex-column">
                <li class="nav-item">
                    <button type="button" class="btn btn-light tab_button" onclick=${selectInboxTab}>
                        Входящие
                    </button>
                </li>
                <li class="nav-item">
                    <button type="button" class="btn btn-light tab_button" onclick=${selectTodayTab}>
                        Сегодня
                    </button>
                </li>
                <li class="nav-item">
                    <button type="button" class="btn btn-light tab_button" onclick=${selectUpcomingTab}>
                        Предстоящие
                    </button>
                </li>
                <li class="nav-item">
                    <button type="button" class="btn btn-light tab_button" onclick=${selectAnytimeTab}>
                        В любое время
                    </button>
                </li>
                <li class="nav-item">
                    <button type="button" class="btn btn-light tab_button">
                        Когда нибудь
                    </button>
                </li>
                <li class="nav-item">
                    <button type="button" class="btn btn-light tab_button">
                        Корзина
                    </button>
                </li>
            </ul>
        </div>`
}

export{
    Sidebar,
}
