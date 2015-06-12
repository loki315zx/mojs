# Path easing / Property curves

Lets consider the example below to see the case when we need precise control over easing function. We will take something really easy and then intricate the animation gradually. The start will be a simple falling square:

``` javascript
var square = document.querySelector('#js-square');
var tween = new Tween({
  onUpdate: function (progress) {
    square.style.transform = 'translateY(' + 100*progress + 'px)';
  }
}).start();
```

###### *note*: Im not using vendor prefixes here for the sake of simplicity but some browsers still do need them.

We have one sloppy movement here, it doesn’t really look like something falling at all, lets add bounce easing:

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

But what if we eventually want to change the weight of our object so it will have much wider bouncing amplitude range? That’s the point where the ` Path easing ` became irreplaceable. Lets jump to vector graphics editor with this common graph as a bootstrap. Any vector editor will do, I prefer using ` Sketch ` lately, but any that can produce ` SVG ` path works. There is ` .svg file ` I've made for you. We will amplify the bouncing curves a bit, to add our motion the fill of much more lighter object( or much more bouncy one made of rubber instead of wood for instance). Thats what [I have](#):

![Screen Shot 2015-06-11 at 11.38.35](/Users/mac/Desktop/Screen Shot 2015-06-11 at 11.38.35.png)

Now we will copy the ` SVG path commands ` to our code, generating the custom easing function from it with ` mojs.easing.path ` function (bouncyEasing in the code below):

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

You can see how the comprehensiveness of your easing function is now limited by your imagination only. Hooray hooray ` mo·js `!

We won’t stop here, right? We are building an eye catching motion instead of just common one, so lets add the [secondary action](https://www.youtube.com/watch?v=MjBHWw1TbP4) to convey more information about the environment that our object moves in. I’m thinking about the simplest one - a ` shadow ` , are you? But firstly we need to contemplate how shadow work in our real world. Presuming the source of light hangs straight above the object somewhere - obviously our shadow will became harder accumulated when our square moves closer to the ground:

![Screen Shot 2015-06-11 at 12.57.21](/Users/mac/Desktop/Screen Shot 2015-06-11 at 12.57.21.png)

From the flip side, it gets lighter and much more diffused covering larger area when it moves further from the ground and closer to the source of light:

![Screen Shot 2015-06-11 at 13.01.13](/Users/mac/Desktop/Screen Shot 2015-06-11 at 13.01.13.png)

Apparently the same bounce easing we made earlier will work great here for shadow’s opacity — it starts from 0 growing to 1 on the first “touch” of the ground, then becomes a bit lighter on bounce periods and eventually ends up on value of 1. Hopefully you can easily read easing function’s graph already If you don’t yet, don’t worry, it takes some time to get accustomed to it, let me try to explain it on the graph:

![Screen Shot 2015-06-11 at 13.16.14](/Users/mac/Desktop/Screen Shot 2015-06-11 at 13.16.14.png)



``` javascript
var square = document.querySelector('#js-square'),
    shadow = document.querySelector('#js-shadow'),
    bouncyEasing = mojs.easing.path('M1,78.6407204 C1,78.6407204 73.1776505,65.8290405 84.125685,3 C99.25,89.6503906 156.230764,3 156.230764,3 C156.230764,3 165.107422,52.8183594 194.204742,3 C194.204742,3.00000001 199.835938,26.4492188 213.198989,3');

var tween = new mojs.Tween({
  onUpdate: function (progress) {
    var bounceProgress = bouncyEasing(progress);
    square.style.transform = 'translateY(' + 100*bounceProgress + 'px)';
    shadow.style.opacity   = bounceProgress;
  }
}).start();
```

Ok cool. What about the size? Would the bouncy easing work for scale too? Unfortunately no, but no worries we have billions of easing functions now. Lets jump back to vector editor and sketch the scale easing:

![Screen Shot 2015-06-12 at 10.55.39](/Users/mac/Desktop/Screen Shot 2015-06-12 at 10.55.39.png)

So the shadow ` scale ` value starts somewhere at ` 2 `, then shrinks to ` 1 ` when the object touches the ground line, and scales down when object bounces from the ground. 

``` js
var square = document.querySelector('#js-square'),
    shadow = document.querySelector('#js-shadow'),
    bouncyEasing = mojs.easing.path('M1,78.6407204 C1,78.6407204 73.1776505,65.8290405 84.125685,3 C99.25,89.6503906 156.230764,3 156.230764,3 C156.230764,3 165.107422,52.8183594 194.204742,3 C194.204742,3.00000001 199.835938,26.4492188 213.198989,3'),
    shadowScaleEasing = mojs.easing.path('M0,0 C5.07689534,7.65150309 10.7347387,36.0266837 16.6678547,100 C16.6678547,101.794598 28.3767503,-15.0879941 44.1008572,100 C44.1008572,100.762447 52.2136908,43.5495229 63.0182497,100 C63.0182497,100.96434 68.5097621,70.750671 76.4643231,100 C76.4643231,100 80.5297451,83.4563406 85.8902733,100 C85.8902733,100.762447 88.2638161,90.3388595 92.132216,100 C92.132216,100.156767 94.1849839,95.5211648 96.918051,100 C96.918051,100.156767 98.7040751,98.0618441 100,100');

var tween = new mojs.Tween({
  onUpdate: function (progress) {
    var bounceProgress = bouncyEasing(progress);
    square.style.transform = 'translateY(' + 100*bounceProgress + 'px)';
    shadow.style.opacity   = bounceProgress;
  }
}).start();
```

So you may have noticed that the graph doesn’t really look like easing graph anymore, and you are right! The easing starts from ` 0, 0 ` and ends up at ` 1, 1 ` but our ` scale graph ` starts at ` 0, 2 ` and ends at ` 1, 1 `. This is another type of graphs - ` property curves ` because they are describing how specific property acts during progress changes and not obligatory should start at ` 0, 0` and end at ` 1, 1 `.  If you are familiar with After Effects workflow, this types of graphs can be known as [animation curves](#). Thankfully  ` mo·js ` is capable to handle those too. As you can see this property curves are way more powerful then just an easing function, but it has it’s performance price, so don’t add a lot of them!





