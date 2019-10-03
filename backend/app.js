let express = require('express')
let app = express()
const PORT = process.env.PORT

app.get("/", function (req, res) {
    res.json({
        res : "data",
        req : "field"
    })
})

app.listen(PORT, function () {
    console.log(`Listening on port ${PORT}`);
})
