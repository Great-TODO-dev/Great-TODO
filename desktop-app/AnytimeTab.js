function AnytimeTab(wire) {  
    return wire()`
        <h1 class="tab_title">В любое время</h1>
        <div class="events_list">
            <div class="form-check event">
                <input class="form-check-input" type="checkbox" id="defaultCheck1">
                <lable class="form-check-label event_title" for="defaultCheck1">
                    Задача
                </lable>
            </div>
            <div class="form-check event">
                <input class="form-check-input" type="checkbox" id="defaultCheck1">
                <lable class="form-check-label event_title" for="defaultCheck1">
                    Задание
                </lable>
            </div>
            <div class="form-check event">
                <input class="form-check-input" type="checkbox" id="defaultCheck1">
                <lable class="form-check-label event_title" for="defaultCheck1">
                    Ещё одно задание
                </lable>
            </div>
            <div class="form-check event">
                <input class="form-check-input" type="checkbox" id="defaultCheck1">
                <lable class="form-check-label event_title" for="defaultCheck1">
                    Другая задача
                </lable>
            </div>
        </div>`
}

export {
    AnytimeTab
}