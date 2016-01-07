# slmc
Examples of pi-calculus processes and their properties using the [Spatial Logic Model Checker](http://ctp.di.fct.unl.pt/SLMC/)

The source code vendored here as `sl-mc-v2.01` is licensed GPL2.0

Use the dockerfile to get a development environment set up:

```
docker build -t slmc .
docker run -it slmc
```

Then use `screen` to have multiple windows within the container.

Remember to copy any changes made out of the container to save them.

