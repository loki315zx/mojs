module.exports = {
  watch: true,
  entry: [
    __dirname + '/js/app.cjsx'
  ],
  module: {
    loaders: [
      { test: /\.(jsx|es6)$/, exclude: /node_modules/, loaders: ['6to5-loader?optional=coreAliasing'] },
      { test: /\.coffee$/, exclude: /node_modules/, loaders: ['coffee-loader?bare=true'] },
      { test: /\.cjsx$/, loaders: ['coffee', 'cjsx']},
      { test: /\.styl$/, loader: 'style-loader!css-loader!stylus-loader?paths=node_modules/' },
    ]
  },
  output: {
    path: __dirname + '/dist',
    filename: 'app.js'
  },
  resolve: {
    extensions: ['', '.js', '.jsx', '.es6', '.styl', '.coffee', '.cjsx']
  }
};
