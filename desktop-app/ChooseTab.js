import { store } from "./index.js";
import { tabName } from "./tabName.js";
import { InboxTab } from "./InboxTab.js";
import { TodayTab } from "./TodayTab.js";
import { UpcomingTab } from "./UpcomingTab.js";
import { AnytimeTab } from "./AnyTimeTab.js";

function chooseTab(wire) {
    switch (store.currTabName) {
        case tabName.INBOX:
            return InboxTab(wire);
        case tabName.TODAY:
            return TodayTab(wire);
        case tabName.UPCOMING:
            return UpcomingTab(wire);
        case tabName.ANYTIME:
            return AnytimeTab(wire);
        default:
            break;
    }
}

export {
    chooseTab,
}