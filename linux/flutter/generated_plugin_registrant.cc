//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <hundredpay/hundredpay_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) hundredpay_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "HundredpayPlugin");
  hundredpay_plugin_register_with_registrar(hundredpay_registrar);
}
