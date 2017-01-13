from mccaskey/base-fedora-gcc6
maintainer Alex McCaskey <mccaskeyaj@ornl.gov>
run dnf install -y gmp-devel mpfr-devel llvm-devel clang-devel https://github.com/genereese/togo/releases/download/v2.3r7/togo-2.3-7.noarch.rpm
run git clone https://github.com/ORNL-QCI/ScaffCC && cd ScaffCC && make
run cd /projects/ScaffCC && mkdir rpm_build && cd rpm_build && togo configure -n "Alex McCaskey" -e "mccaskeyaj@ornl.gov" \
	&& togo project create scaffold && cd scaffold && mkdir -p root/usr/local/scaffold \
	&& cp -r ../../build root/usr/local/scaffold/ && cp -r ../../Rotations root/usr/local/scaffold/ \
	&& cp -r ../../scaffold root/usr/local/scaffold/ && cp -r ../../scaffold.sh root/usr/local/scaffold/scaffcc \ 
	&& cp -r ../../scripts root/usr/local/scaffold/ && togo file exclude root/usr/local/scaffold && cat spec/header \ 
	&& sed -i -r "s/(Version: *).*/\11.0/" spec/header && sed -i -r "s/(Summary: *).*/\1Scaffold is a compiler built on LLVM and Clang for gate model quantum computing/" spec/header \
	&& sed -i -r "s/(Release: *).*/\11.fc25/" spec/header && sed -i -r "s/(License: *).*/\1BSD/" spec/header \
	&& sed -i -r "s/(Buildarch: *).*/\1x86_64/" spec/header && sed -i -r "s/(Group: *).*/\1Development\/System/" spec/header \
	&& sed -i -r "s/(Requires: *).*/\1gcc-c++ python perl make gmp-devel mpfr-devel boost-devel/" spec/header \
	&& sed -i -r '/Requires/s/^#//g' spec/header \
	&& togo build package && cp rpms/*.rpm /projects/ \
	&& cat spec/header
#run rm -rf /projects/ScaffCC/rpm_build

