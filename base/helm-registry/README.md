this should be its own repo...

this is the main repo
https://github.com/app-registry/appr-helm-plugin

it rquires appr to be in the helm plugin directory  
this has an issue... you cannot use appr outside of the  
`helm registry` command. this plugin allows the `appr` in  
your path to be used with our without the plugin..

```
helm registry login
```
or
```
appr helm diff
```
