
[![CircleCI](https://circleci.com/gh/cyber-dojo/zipper.svg?style=svg)](https://circleci.com/gh/cyber-dojo/zipper)

# cyberdojo/zipper docker image

- A docker-containerized micro-service for [cyber-dojo](http://cyber-dojo.org).
- Creates a tgz file of a practice-session or an individual traffic-light.
- Currently Offline. Needs reworking after storer -> saver re-architecture.

- - - -
API:
  * All methods receive their named arguments in a json hash.
  * All methods return a json hash with a single key.
    * If the method completes, the key equals the method's name.
    * If the method raises an exception, the key equals "exception".

- - - -
# zip
Creates a tgz file of the kata with the given kata_id, in json format
(the format [storer](https://github.com/cyber-dojo/storer) uses).
The caller must share the tgz directory (/tmp_zipper) with zipper.
- parameter, eg
```json
  {  "kata_id": "A551C528C3" }
```
- returns the filename of the created tgz file, eg
```json
  { "zip": "/tmp_zipper/A551C528C3.tgz" }
```

- - - -
# zip_tag
Creates a tgz file of visible files associated with the kata with
the given kata_id, the avatar with the given avatar_name, and the
traffic-light with the given tag. The tgz file also contains a
manifest.json file suitable for creating a custom
[start-point](http://blog.cyber-dojo.org/2016/08/creating-your-own-start-points.html).
The caller must share the tgz directory (/tmp_zipper) with zipper.
- parameters, eg
```json
  {  "kata_id": "A551C528C3",
     "avatar_name": "salmon",
     "tag": 23
  }
```
- returns the filename of the created tgz file, eg
```json
  { "zip_tag": "/tmp_zipper/A551C528C3_salmon_23.tgz" }
```

![cyber-dojo.org home page](https://github.com/cyber-dojo/cyber-dojo/blob/master/shared/home_page_snapshot.png)
