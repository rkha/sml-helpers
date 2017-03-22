structure Utils =
struct
	fun quit() = OS.Process.exit(OS.Process.success);
	fun die() = OS.Process.exit(OS.Process.failure);
end