// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import DropdownController from "./dropdown_controller"
application.register("dropdown", DropdownController)

import EditorController from "./editor_controller"
application.register("editor", EditorController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import LikeController from "./like_controller"
application.register("like", LikeController)

import TextAutoExpandController from "./text_auto_expand_controller"
application.register("text-auto-expand", TextAutoExpandController)
