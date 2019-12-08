class MainStore{
    constructor(){
        this._currTabName = TODAY;
    }
    
    chnageTabName(tabName) {
        this._currTabName = tabName
    }
}

export {
    MainStore
}