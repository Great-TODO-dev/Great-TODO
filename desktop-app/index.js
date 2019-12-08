import { wire, bind } from "../node_modules/hyperhtml/esm.js"
import { App } from "./App.js";
const appEl = document.getElementById("app");
const render = bind(appEl);

render`
    ${App(wire)}`