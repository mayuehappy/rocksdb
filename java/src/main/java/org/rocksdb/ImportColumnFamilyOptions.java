//  Copyright (c) Meta Platforms, Inc. and affiliates.
//
//  This source code is licensed under both the GPLv2 (found in the
//  COPYING file in the root directory) and Apache 2.0 License
//  (found in the LICENSE.Apache file in the root directory).

package org.rocksdb;

/**
 * ImportColumnFamilyOptions is used by ImportColumnFamily()
 * <p>
 * Note that dispose() must be called before this instance become out-of-scope
 * to release the allocated memory in c++.
 *
 */
public class ImportColumnFamilyOptions extends RocksObject {
  /**
   * Constructor
   *
   * @param moveFiles Can be set to true to move the files instead of copying them.
   *   Default: false
   */
  public ImportColumnFamilyOptions(final boolean moveFiles) {
    super(newImportColumnFamilyOptions(moveFiles));
  }

  private static native long newImportColumnFamilyOptions(boolean moveFiles);
  @Override protected final native void disposeInternal(final long handle);
}
