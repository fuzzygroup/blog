---
layout: post
title: Making the Trix Editor Resizable
category: trix
tags: ["css", "trix"]
---
{:.center}
![IMG_0935.jpeg](/blog/assets/IMG_0935.jpeg)

It is interesting that my first post of 2020 is actually a CSS trick.  That's quite an evolution in my web development practices from 2019.  Here is a CSS addition that limits the max height of your trix editor window and makes it resizable:

```css
.trix-content {
  max-height: 800px !important;   #set whatever height you want
  overflow-y: auto;
}
```

## Trix Editor Resources

* [https://trix-editor.org/](https://trix-editor.org/)
* [Go Rails](https://gorails.com/episodes/trix-editor)
* [Headway on Trix](https://headway.io/blog/how-to-use-trix-and-shrine-for-wysiwyg-editing-with-drag-and-drop-image-uploading/)
* [Github](https://github.com/basecamp/trix)

