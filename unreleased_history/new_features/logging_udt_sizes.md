Start logging non-zero user-defined timestamp sizes in WAL to signal user key format in subsequent records and use it during recovery. This change will break recovery from WAL files written by early versions that contain user-defined timestamps. The workaround is to ensure there are no WAL files to recover (i.e. by flushing before close) before upgrade.