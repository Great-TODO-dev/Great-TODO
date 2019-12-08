// import { MainStore } from "./MainStore.js"

// function selectToday(){
//     MainStore.chnageTabName('Today')
//     render();
// }

function Sidebar(wire) {
    return wire()`
        <div class="col-sm-3 sidebar">
            <ul class="nav flex-column">
                <li class="nav-item">
                    <button type="button" class="btn btn-light inset_button">
                        Входящие
                    </button>
                </li>
                <li class="nav-item">
                    <button type="button" class="btn btn-light inset_button">
                        Сегодня
                    </button>
                </li>
                <li class="nav-item">
                    <button type="button" class="btn btn-light inset_button">
                        Предстоящие
                    </button>
                </li>
                <li class="nav-item">
                    <button type="button" class="btn btn-light inset_button">
                        В любое время
                    </button>
                </li>
                <li class="nav-item">
                    <button type="button" class="btn btn-light inset_button">
                        Когда нибудь
                    </button>
                </li>
                <li class="nav-item">
                    <button type="button" class="btn btn-light inset_button">
                        Хронология
                    </button>
                </li>
                <li class="nav-item">
                    <button type="button" class="btn btn-light inset_button">
                        Корзина
                    </button>
                </li>
            </ul>
        </div>`
}

export{
    Sidebar,
}
