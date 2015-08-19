# Easing functions / Property curves

## Preface

Easing plays the crucial role in sense  of animation giving to it the right fill and cadence. It is the secret sauce ingredient that makes a good motion delightful. Linear movement trudging unnatural and  sloppy, this fact comes from the physical laws - nothing in our world moves linearly.

> Using a term like nonlinear science is like referring to the bulk of zoology as the study of non-elephant animals.
> 
> - Stanislaw Ulam

Animation with equal interim spacing(read with linear easing) can envoke in our brain nothing then suspicious or rum response. This is why so important to have the full control of the easing functions.

Fortunately `mo·js` has the best set of easing functions of various types in the modern web, that I’m going to present to you in this article. The easing types are:

- Common easing functions
- Cubic Bezier Curves 
- Spring easing
- Path easing (Animation Curves if you are into AE stuff)


Firstly I will rake you sparingly thru the `common easing functions` as you probably already familiar with them. Then we will swiftly go thru the `cubic bezeir curves` and `spring easing` as they give us a little bit more control over the easing. Lastly we will sort out the `paths easing` that will give us the terrific power on timing functions!

## Common easing functions

The full list is:

- *linear*
- *ease*: in/out/inout
- *quad*: in/out/inout
- *cubic*: in/out/inout
- *quart*: in/out/inout
- *quint*: in/out/inout
- *sin*: in/out/inout
- *expo*: in/out/inout
- *circ*: in/out/inout
- *back*: in/out/inout
- *elastic*: in/out/inout
- *bounce*: in/out/inout


If you have ever used easing functions in other libraries the list should seem familiar for you. You can pass them around to modules as `strings` with easing's name delimited by `.` or directly as `functions`, that are available on `mojs.easing` object:

``` javascript
var tween = new Tween({
  easing: ‘cubic.in’, // ‘cubic.inout’,
  onUpdate: function (p) {
      // p is the current progress
  }
});
```

or

``` javascript
var tween = new Tween({
  easing:  mojs.easing.cubic.in,
  onUpdate: function (p) {
      // p is the current progress
  }
});
```



or even

`code`

Nothing special but pretty useful if you need one of the predefined functions. But what to do if you need a custom one? That’s where the `cubic bezier curves` comes into play.



## Cubic Bezier Curves

So if we want to tweak one of the predefined easing, we can do it by generating a new entity by passing cubic bezier handles coordinates to `mojs.easing.bezier` function, it will return a new function with behaviour you want. To get coordinates points of the curve you can use the good old [caesar tool](http://matthewlein.com/ceaser/), it was honed for CSS but will do for us well too. All we need is the coordinates itself:

  [gif]

``` javascript
var tween = new Tween({
  easing:  mojs.easing.bezier(0.555, -0.330, 0.075, 1.395),
  onUpdate: function (p) {
      // p is the current progress
  }
});
```

It is worth mentioning that you can also pass to modules the array with coordinates like `[0.555, -0.330, 0.075, 1.395]` and it will be auto generated for you.

``` javascript
var tween = new Tween({
  easing:  [0.555, -0.330, 0.075, 1.395],
  onUpdate: function (p) {
      // p is the current progress
  }
});
```

This would work exactly the same as for the previous example.

## Spring easing

## Path easing

Path easing uses `SVG path commands` to give you the full power of vector editor over you easing function. It can be also used as `property curve` if you are familiar with Adobe After Effects, this concept is probably know for you as [animation curves](https://vimeo.com/68022971). This type of easing not only gives you precise timing function but also changes the way you treat your code. It may seem odd first, but stay with me, I promise this will be the most comprehensive timing function you ever used in the web before.