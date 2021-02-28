{
  "spriteId": {
    "name": "spr_semi_solid",
    "path": "sprites/spr_semi_solid/spr_semi_solid.yy",
  },
  "solid": false,
  "visible": true,
  "spriteMaskId": null,
  "persistent": false,
  "parentObjectId": {
    "name": "obj_semi_solid",
    "path": "objects/obj_semi_solid/obj_semi_solid.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,"parent":{"name":"obj_activable","path":"objects/obj_activable/obj_activable.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":3,"collisionObjectId":null,"parent":{"name":"obj_activable","path":"objects/obj_activable/obj_activable.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
  ],
  "properties": [
    {"varType":6,"value":"-1","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[
        "-1",
        "1",
      ],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"init_dir","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":5,"value":"spr_semi_solid","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[
        "GMSprite",
      ],"resourceVersion":"1.0","name":"sprite","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":0,"value":".5","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"movespd","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":6,"value":"\"one\"","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[
        "\"one\"",
        "\"two\"",
      ],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"status","tags":[],"resourceType":"GMObjectProperty",},
  ],
  "overriddenProperties": [],
  "parent": {
    "name": "Objects",
    "path": "folders/Objects.yy",
  },
  "resourceVersion": "1.0",
  "name": "obj_activable",
  "tags": [],
  "resourceType": "GMObject",
}