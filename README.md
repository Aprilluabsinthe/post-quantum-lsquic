# post-quantum-lsquic all library and build-up


## clone the three repositories
```
git clone --recursive https://github.com/open-quantum-safe/boringssl.git
git clone --recursive  https://github.com/litespeedtech/lsquic.git
git clone --recursive https://github.com/open-quantum-safe/liboqs.git
```

## [should checl]change name for CMAKE file
```
cd /lsquic/src/
mv ls-hpack/ lshpack
```
if the name is already lshpack, skip this step

## build with 
```
chmod +x build_new.sh 
./build_new.sh 
```
Follow instructions

## requires
if build with new UNIX

```
sudo apt-get update
sudo apt-get install build-essential
sudo apt install cmake
sudo apt install ninja-build
sudo apt install golang
sudo apt-get install -y libunwind-dev
sudo apt install zlib1g-dev
sudo apt-get install libz-dev
```
