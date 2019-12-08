var bodyParser = require('body-parser');
let express = require('express')
let app = express()
const PORT = process.env.PORT

var Task = require('./Task');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.get("/", function (req, res) {
    res.json({
        res : "data",
        req : "field"
    })
})

app.get("/events", function (req, res) {
    res.send(Task.Tasks);
})

app.post("/events", function (req, res) {
    var task =  new Task(
        Date.now(),
        req.body.title,
        req.body.descripton,
        req.body.done,
        req.body.tags);
    Task.Tasks.push(task);
    res.send(Task.Tasks);
})

app.put("/events/:id", function(req, res){
    var task = Task.Tasks.find(function(task){
        return task.id === Number(req.params.id)
    });
    task.title = req.body.title;
    task.descripton = req.body.descripton;
    task.done = req.body.done;
    task.tags = req.body.tags;
    //res.send(Task.Tasks);
    res.sendStatus(200);
})

/*
//надо еще подумать
app.get("/events/:tag", function(req, res){
    var new_tasks = Task.Tasks.map(function(tag){
        if tag 
    });
    
})
 */

//не работает все еще 
app.delete("/events/:id", function(req, res){
    var task = Task.Tasks.find(function(task){
        return task.id === Number(req.params.id)
    });
    Task.Tasks.slice(Task.Tasks.indexOf(task), 1);
    res.send(Task.Tasks);
    //res.sendStatus(200);
})

app.listen(PORT, function () {
    console.log(`Listening on port ${PORT}`);
})