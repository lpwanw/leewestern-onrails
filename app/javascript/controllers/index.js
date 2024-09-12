// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import CopyController from "./copy_controller"
application.register("copy", CopyController)

import DropdownController from "./dropdown_controller"
application.register("dropdown", DropdownController)

import EnterScreenController from "./enter_screen_controller"
application.register("enter-screen", EnterScreenController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import LikeController from "./like_controller"
application.register("like", LikeController)

import ModalController from "./modal_controller"
application.register("modal", ModalController)

import PostClickController from "./post_click_controller"
application.register("post-click", PostClickController)

import ScrollController from "./scroll_controller"
application.register("scroll", ScrollController)

import TabController from "./tab_controller"
application.register("tab", TabController)

import TextAutoExpandController from "./text_auto_expand_controller"
application.register("text-auto-expand", TextAutoExpandController)

import TimeagoController from "./timeago_controller"
application.register("timeago", TimeagoController)

import ToastController from "./toast_controller"
application.register("toast", ToastController)

import ToastProviderController from "./toast_provider_controller"
application.register("toast-provider", ToastProviderController)
