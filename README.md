# fmlrc-wtdbg2-plus-docker

Ubuntu 20.04 with some tools for long read error correction and assembly

I am not part of the developer team of any of the software contained here - I just made this image.

In detail, the image is set up with:
 - Ubuntu 20.04
 - Samtools 1.10
 - ropebwt2 (commit 01.02.2021)
 - FMLRC2 0.1.7
 - wtdbg2 v2.5
 - minimap2 v2.24
 - bwa v0.7.17 

To run software you can do the following (this will mount the directory `/in` of the container to the current working directory on your local machine, and allow you to access files in this directory and any sub-directories):
```bash
# run fmlrc
$ docker run --rm -v $(pwd):/in -w /in chrishah/fmlrc-wtdbg2-plus:v062022 fmlrc2
$ docker run --rm -v $(pwd):/in -w /in chrishah/fmlrc-wtdbg2-plus:v062022 fmlrc2-convert

#run wtdbg2
$ docker run --rm -v $(pwd):/in -w /in chrishah/fmlrc-wtdbg2-plus:v062022 wtdbg2

```

You can also enter the container environment and work within it. All executables should be in the `PATH`.
```bash
$ docker run -it --rm -v $(pwd):/in -w /in chrishah/fmlrc-wtdbg2-plus:v062022 /bin/bash
```

