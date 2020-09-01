# fmlrc-wtdbg2-plus-docker

Ubuntu 18.04 with some tools for long read error correction and assembly

I am not part of the developer team of any of the software contained here - I just made this image.

In detail, the image is set up with:
 - Ubuntu 18.04
 - Samtools 1.7.1
 - Python 2.7.17 (with numpy==1.16.6, msbwt==0.3.0)
 - ropebwt2 (commit 1.10.2018)
 - fmlrc v1.0.0
 - wtdbg2 v2.5
 - minimap2 v2.17
 - bwa v0.7.17 

To run software you can do the following (this will mount the directory `/in` of the container to the current working directory on your local machine, and allow you to access files in this directory and any sub-directories):
```bash
# run fmlrc
$ docker run --rm -v $(pwd):/in -w /in chrishah/fmlrc-wtdbg2-plus:v092020 fmlrc

#run wtdbg2
$ docker run --rm -v $(pwd):/in -w /in chrishah/fmlrc-wtdbg2-plus:v092020 wtdbg2

```

You can also enter the container environment and work within it. All executables should be in the `PATH`.
```bash
$ docker run -it --rm -v $(pwd):/in -w /in chrishah/fmlrc-wtdbg2-plus:v092020 /bin/bash
```

