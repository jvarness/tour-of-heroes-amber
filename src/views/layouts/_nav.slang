- active = context.request.path == "/" ? "active" : ""
- helloActive = context.request.path == "/hello" ? "active" : ""
a class="nav-item #{active}" href="/" Home
a class="nav-item #{helloActive}" href="/hello" Hello
