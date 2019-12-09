import { tabName } from "./tabName.js";

class MainStore {
    constructor() {
        this.currTabName = tabName.INBOX;
    }
    
    chnageTabName(tabName) {
        this.currTabName = tabName;
    }
}

export {
    MainStore
}