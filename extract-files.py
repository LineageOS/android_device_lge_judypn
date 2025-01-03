#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

blob_fixups: blob_fixups_user_type = {
    (
        'vendor/lib/liblgsnpeawb.so',
        'vendor/lib/libSNPE.so'
    ): blob_fixup()
        .replace_needed('libstdc++.so', 'libstdc++_vendor.so')
}  # fmt: skip


module = ExtractUtilsModule(
    'judypn',
    'lge',
    blob_fixups=blob_fixups,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(module, 'sdm845-common', module.vendor)
    utils.run()
