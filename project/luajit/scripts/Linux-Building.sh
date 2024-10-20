# Author: Lily Ross (mcagabe19)

git clone https://github.com/LuaJIT/LuaJIT.git -b v2.1 --depth 1

cd LuaJIT

mkdir build

if command -v nproc &> /dev/null; then
    JOBS=$(nproc)
elif command -v sysctl &> /dev/null; then
    JOBS=$(sysctl -n hw.ncpu)
else
    JOBS=4
fi

make clean
cd src
make -j$JOBS BUILDMODE=static
cd ..
cp src/libluajit.a build/libluajit.a

# copy includes
mkdir build/include

cp src/lua.hpp build/include
cp src/lauxlib.h build/include
cp src/lua.h build/include
cp src/luaconf.h build/include
cp src/lualib.h build/include
cp src/luajit.h build/include

# go back
cd ../
