BORINGSSL_DIR=$PWD/boringssl
LSQUIC_DIR=$PWD/lsquic

echo -n "Build LIBOQS? (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
	cd liboqs
	rm -rf build
	mkdir build && cd build
	cmake -GNinja -DCMAKE_INSTALL_PREFIX=$BORINGSSL_DIR/oqs -DOQS_USE_OPENSSL=OFF ..
	ninja
	sudo ninja install
	echo "LIBOQS SUCCESSFULLY BUILT"
fi



echo -n "Build BORINGSSL? (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
	cd $BORINGSSL_DIR
	rm -rf build
	mkdir build && cd build
	cmake -DBUILD_SHARED_LIBS=ON -GNinja ..
	ninja
	echo "BORINGSSL SUCCESSFULLY BUILT"
fi



echo -n "Build LSQUIC? (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then
	cd $LSQUIC_DIR
	rm -rf build
	mkdir build && cd build
	cmake -DBORINGSSL_DIR=$BORINGSSL_DIR -DBORINGSSL_LIB_crypto=$BORINGSSL_DIR/build/crypto/libcrypto.so -DBORINGSSL_LIB_ssl=$BORINGSSL_DIR/build/ssl/libssl.so -GNinja ..
	ninja
	echo "lsquic SUCCESSFULLY BUILT"
fi




echo "Library building has finished."
