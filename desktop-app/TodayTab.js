function Inbox(wire) {  
    wire()`
        <h1 class="inset_title">Сегодня</h1>
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
        </div>`
}