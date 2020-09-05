
@static Sys.iswindows() ?
	(Sys.WORD_SIZE == 64 ? (const libnetcdf = "netcdf4_w64") : (const libnetcdf = "netcdf4_w32")) : 
	(
		@static Sys.islinux() ? libnetcdf = split(readlines(pipeline(`ldd $s`, `grep libnetcdf`))[1])[3] :
		(
			Sys.isapple() ? libnetcdf = split(readlines(pipeline(`otool -L $s`, `grep libnetcdf`))[1])[1] :
			libnetcdf = "libnetcdf"		# Default for other unixs
		)
	)
