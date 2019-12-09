import { wire, bind } from "../node_modules/hyperhtml/esm.js"
import { App } from "./App.js";
import { MainStore } from "./MainStore.js";

const appEl = document.getElementById("app");
const render = bind(appEl);
const store = new MainStore;

function renderApp() {
    render`${App(wire)}`
}

renderApp()

export {
    store,
    renderApp
}