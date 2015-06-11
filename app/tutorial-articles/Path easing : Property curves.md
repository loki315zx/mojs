# Path easing / Property curves

Lets consider the example below to see the case when we need precise control over easing function. We will take something really easy and then indicate the animation gradually. The start will be a simple falling square:

``` javascript
var square = document.querySelector('#js-square');
var tween = new Tween({
  onUpdate: function (progress) {
    square.style.transform = 'translateY(' + 100*progress + 'px)';
  }
}).start();
```

###### *note*: Im not using vendor prefixes here for the sake or simplicity but some browsers do need them.

We have one sloppy movement here it doesn’t really look like something falling at all, lets add bounce easing:

``` javascript
var square = document.querySelector('#js-square');
var tween = new Tween({
  easing:   'bounce.out'
  onUpdate: function (progress) {
    square.style.transform = 'translateY(' + 100*progress + 'px)';
  }
}).start();
```

