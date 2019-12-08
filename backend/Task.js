'use strict';

class Task {
    constructor(id, title, done, descripton, tags){
        this.id = id;
        this.title = title;
        this.done = done;
        this.descripton = descripton;
        this.tags = [tags];
    }

    static Tasks = [
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
}

//console.log(Task.Tasks);

module.exports = Task;
