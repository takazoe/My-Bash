echo "Configuring and building Thirdparty/DBoW2 ..."

cd Thirdparty/DBoW2
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j

cd ../../g2o

echo "Configuring and building Thirdparty/g2o ..."

mkdir build
cd build
sudo ln -s /usr/include/eigen3/Eigen /usr/local/include/Eigen
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j

cd ../../Sophus

echo "Configuring and building Thirdparty/Sophus ..."

mkdir build
cd build
#sed -i 's/++11/++14/g' CMakeLists.txt
#sed -i 's/CMAKE_CXX_STANDARD 11/CMAKE_CXX_STANDARD 14/g' CMakeLists.txt
cmake .. -DCMAKE_BUILD_TYPE=Release
make

cd ../../../

echo "Uncompress vocabulary ..."

cd Vocabulary
tar -xf ORBvoc.txt.tar.gz
cd ..

echo "Configuring and building ORB_SLAM3 ..."

sed -i 's/++11/++14/g' CMakeLists.txt
sed -i 's/ 4.4/ 4.2/g' CMakeLists.txt

mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j4