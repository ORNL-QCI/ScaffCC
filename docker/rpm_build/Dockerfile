from mccaskey/base-fedora-gcc6
maintainer Alex McCaskey <mccaskeyaj@ornl.gov>
run dnf install -y gmp-devel mpfr-devel https://github.com/genereese/togo/releases/download/v2.3r7/togo-2.3-7.noarch.rpm
run git clone https://github.com/ORNL-QCI/ScaffCC && cd ScaffCC && make
run cd /projects/ScaffCC && mkdir rpm_build && cd rpm_build && togo configure -n "Alex McCaskey" -e "mccaskeyaj@ornl.gov" \
	&& togo project create scaffold && cd scaffold && mkdir -p root/usr/local/scaffold \
	&& mkdir -p root/usr/local/scaffold/build/Release+Asserts/include/extra-tools \
	&& cp -r ../../build root/usr/local/scaffold/ && cp -r ../../Rotations root/usr/local/scaffold/ \
	&& cp -r ../../scaffold root/usr/local/scaffold/ && cp -r ../../scaffold.sh root/usr/local/scaffold/scaffcc \ 
	&& cp -r ../../scripts root/usr/local/scaffold/ && cp -r ../../clang/include/* root/usr/local/scaffold/build/Release+Asserts/include/ \
	&& cp -r ../../llvm/include/* root/usr/local/scaffold/build/Release+Asserts/include/ \
	&& cp -r ../../build/tools/clang/include/* root/usr/local/scaffold/build/Release+Asserts/include/extra-tools/ \
	&& cp ../../build/include/llvm/Support/DataTypes.h root/usr/local/scaffold/build/Release+Asserts/include/llvm/Support/ \
	&& cp ../../build/include/llvm/Config/*.h root/usr/local/scaffold/build/Release+Asserts/include/llvm/Config/ \
	&& togo file exclude root/usr/local/scaffold && cat spec/header \ 
	&& sed -i -r "s/(Version: *).*/\12.0/" spec/header && sed -i -r "s/(Summary: *).*/\1Scaffold is a compiler built on LLVM and Clang for gate model quantum computing/" spec/header \
	&& sed -i -r "s/(Release: *).*/\11.fc25/" spec/header && sed -i -r "s/(License: *).*/\1BSD/" spec/header \
	&& sed -i -r "s/(Buildarch: *).*/\1x86_64/" spec/header && sed -i -r "s/(Group: *).*/\1Development\/System/" spec/header \
	&& sed -i -r "s/(Requires: *).*/\1gcc-c++ python perl make gmp-devel mpfr-devel boost-devel/" spec/header \
	&& sed -i -r '/Requires/s/^#//g' spec/header \
	&& togo build package && cp rpms/*.rpm /projects/ \
	&& cat spec/header
run rm -rf /projects/ScaffCC/rpm_build

