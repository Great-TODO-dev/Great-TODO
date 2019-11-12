var bodyParser = require('body-parser');
let express = require('express')
let app = express()
const PORT = process.env.PORT

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

var events = [
    {
        id: 1,
        title: 'something to do',
        done: true,
        descripton: 'надо сделать дз',
        tags: ['homework']
        //date: Date.now,
        //deadline:
    },
    {
        id: 2,
        title: 'do post zapros',
        done: true,
        descripton: 'надо сделать дз',
        tags: ['homework']
    },
    {
        id: 3,
        title: 'do put request',
        done: true,
        descripton: 'надо сделать дз',
        tags: ['homework', 'work']
    }
];

app.get("/", function (req, res) {
    res.json({
        res : "data",
        req : "field"
    })
})

app.get("/events", function (req, res) {
    res.send(events);
})

app.post("/events", function (req, res) {
    var event = {
        id: Date.now(),
        title: req.body.title,
        done: req.body.done,
        descripton: req.body.descripton,
        tags: [req.body.tags]
        //name: req.body.name
    };
    events.push(event);
    res.send(events);
})

app.put("/events/:id", function(req, res){
    var event = events.find(function(event){
        return event.id === Number(req.params.id)
    });
    event.title = req.body.title;
    //res.send(events)
    res.sendStatus(200);
})

//НЕ РАБОТАЕТ ПОКА ЧТО
app.delete("/events/:id", function(req, res){
    var events = events.filter(function(event){
        return event.id !== Number(req.params.id)
    });
    res.send(events);
    //res.sendStatus(200);
})

app.listen(PORT, function () {
    console.log(`Listening on port ${PORT}`);
})
