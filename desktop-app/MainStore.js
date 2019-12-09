class MainStore {
    constructor() {
        this._currTabName = 'INBOX';
    }
    
    chnageTabName(tabName) {
        this._currTabName = tabName;
    }
}

export {
    MainStore
}