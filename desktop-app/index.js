import { wire, bind } from "../node_modules/hyperhtml/esm.js"

const appEl = document.getElementById("app");
const render = bind(appEl);

render`
    <div class="container">
        <div class="row">
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
            </div>
            <div class="col-sm-9 inset_info">
                <h1 class="inset_title">Входящие</h1>
                <div class="events_list">
                    <div class="form-check event">
                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
                        <lable class="form-check-label event_title" for="defaultCheck1">
                            Починить машину во дворе
                        </lable>
                        <div class="event_time text-secondary">Осталось 2 дня</div>
                    </div>
                    <div class="form-check event">
                        <input class="form-check-input" type="checkbox" id="defaultCheck1">
                        <lable class="form-check-label event_title" for="defaultCheck1">
                            Починить ещё одну машину во дворе
                        </lable>
                        <div class="event_time text-secondary">Осталось 12 дней</div>
                    </div>
                </div>
            </div>
        </div>
    </div>`