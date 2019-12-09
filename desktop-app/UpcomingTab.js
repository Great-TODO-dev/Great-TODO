function UpcomingTab(wire) {  
    return wire()`
        <h1 class="tab_title">Предстоящие</h1>
        <div class="events_list">
            <div class="date_block"> 
                <div class="date">10 Сегодня</div>
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
            <div class="date_block"> 
                <div class="date">11 Завтра</div>
                <div class="form-check event">
                    <input class="form-check-input" type="checkbox" id="defaultCheck1">
                    <lable class="form-check-label event_title" for="defaultCheck1">
                        Задание
                    </lable>
                    <div class="event_time text-secondary">Осталось 2 дня</div>
                </div>
                <div class="form-check event">
                    <input class="form-check-input" type="checkbox" id="defaultCheck1">
                    <lable class="form-check-label event_title" for="defaultCheck1">
                        Ещё задание
                    </lable>
                    <div class="event_time text-secondary">Осталось 12 дней</div>
                </div>
            </div>
            <div class="date_block"> 
                <div class="date">12 Послезавтра</div>
                <div class="form-check event">
                    <input class="form-check-input" type="checkbox" id="defaultCheck1">
                    <lable class="form-check-label event_title" for="defaultCheck1">
                        Задача
                    </lable>
                    <div class="event_time text-secondary">Осталось 2 дня</div>
                </div>
                <div class="form-check event">
                    <input class="form-check-input" type="checkbox" id="defaultCheck1">
                    <lable class="form-check-label event_title" for="defaultCheck1">
                        Ещё задача
                    </lable>
                    <div class="event_time text-secondary">Осталось 12 дней</div>
                </div>
            </div>
        </div>`
}

export {
    UpcomingTab
}