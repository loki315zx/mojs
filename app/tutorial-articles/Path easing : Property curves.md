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
  onUpdate: function (progress) {
    var bounceProgress = mojs.easing.bounce.out(progress);
    square.style.transform = 'translateY(' + 100*bounceProgress + 'px)';
  }
}).start();
```

We have added the bounce easing by passing the linear progress to the `bounce.out` function that is available on `mojs.easing` object - the place where all easing functions and constructors are stored. The result is pretty obvious - you probably did it thousands times - we have something that kind of looking like falling object with it’s own physics, despite the fact that it is not. This bounce easing in fact represents our object's parameters like the material it is made of or weight of the object. Savvy readers starting to grasp the main problem with the easing function we have used - it is limited to only one set of parameters and we can’t change them - they are hardcoded in this graph:

![Screen Shot 2015-06-11 at 11.26.29](/Users/mac/Desktop/Screen Shot 2015-06-11 at 11.26.29.png)

Figure1: Common bounce easing graph

But what if we eventually want to change the weight of our object so it will have much wider bouncing amplitude range? That’s the point where the ` Path easing ` became irreplaceable. Lets jump to vector graphics editor with this common graph as a bootstrap. Any vector editor will do I prefer using ` Sketch ` lately, but any that can produce ` SVG ` path works. There is ` .svg file ` I've made for you. We will amplify the bouncing curves a bit, to add our motion the fill of much more lighter object( or much more bouncy one made of rubber instead of wood for instance). Thats what [I have](#):

![Screen Shot 2015-06-11 at 11.38.35](/Users/mac/Desktop/Screen Shot 2015-06-11 at 11.38.35.png)

Now we will copy the ` SVG path commands ` to our code, generating the custom easing function from it:

``` javascript
var square = document.querySelector('#js-square'),
    bouncyEasing = mojs.easing.path('M1,78.6407204 C1,78.6407204 73.1776505,65.8290405 84.125685,3 C99.25,89.6503906 156.230764,3 156.230764,3 C156.230764,3 165.107422,52.8183594 194.204742,3 C194.204742,3.00000001 199.835938,26.4492188 213.198989,3');

var tween = new Tween({
  onUpdate: function (progress) {
    var bounceProgress = bouncyEasing(progress);
    square.style.transform = 'translateY(' + 100*bounceProgress + 'px)';
  }
}).start();
```

Yay! Now our square fills much more lighter!

Now you can see how the comprehensiveness of your easing function is limited by your imagination only. Hooray hooray ` mo·js `!

We won’t stop here, right? We are building a eye catching motion instead of just common one, so lets add the [secondary action](https://www.youtube.com/watch?v=MjBHWw1TbP4) to add more information about the environment that our object moves in. I’m thinking about the simplest one - a ` shadow ` , are you? But firstly we need to 



