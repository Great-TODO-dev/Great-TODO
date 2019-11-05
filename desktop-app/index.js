import { wire, bind } from './node_modules/hyperhtml/esm.js'

let render = bind(document.body);
render`
    <div>
        <h1>You did it</h1>
    </div>
`
