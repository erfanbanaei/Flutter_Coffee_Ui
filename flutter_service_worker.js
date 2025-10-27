'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "c3de4795853036a461b270af8a8a2183",
"version.json": "4b772b3b45ccbb30645f21758ad52b01",
"index.html": "d36709bdc5fceb8395aabc587065c669",
"/": "d36709bdc5fceb8395aabc587065c669",
"main.dart.js": "56789d3ca5aa8ec695e7c546813a3f57",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "069640339f428ac204acc923ea488835",
"assets/AssetManifest.json": "2ab54a1ecf9b85eeb97c3b4c129a76f9",
"assets/NOTICES": "dedc7d8ebb3cb8f907570ba83910b33b",
"assets/FontManifest.json": "ccdbee8e1a9b03e897da7561189b7c48",
"assets/AssetManifest.bin.json": "5a926f05bb577c8ef597a38f240aeaf4",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "506705cc490730b900666ad4404480af",
"assets/fonts/MaterialIcons-Regular.otf": "3ac0b4781d0d9c3fb4551b2bf1564295",
"assets/assets/images/coffee2.png": "231e4d671caac65a42eb19f14ad57dea",
"assets/assets/images/coffee1.png": "f56a1f4947cb4332e8dce5e334ca97cf",
"assets/assets/images/Logo.png": "6f450ee08de1eba086477da49a93230c",
"assets/assets/images/coffeeMaker2.png": "6734eccea49e84d44284923b8fdd1948",
"assets/assets/images/beans2.png": "87824a6a828954f55e26e77ccf7f5711",
"assets/assets/images/bannercoffee1.png": "2cf505c405e469832dc0ee4778c5bac9",
"assets/assets/images/coffeeMaker1.png": "5f9d68e612994c6bb412d342baafb492",
"assets/assets/images/beans1.png": "d3304588d9b4e551271a5d89c669cce1",
"assets/assets/icons/Vector-6.png": "4d02d4f33595bf5d1cbaaa0c9c8e3395",
"assets/assets/icons/Vector-7.png": "d23575acc25cde3666b272ce2a2938d2",
"assets/assets/icons/Vector-5.png": "3379d9036748700edcab26c2987551de",
"assets/assets/icons/Group-1.png": "320c422ac0e05044442d31394e638bf6",
"assets/assets/icons/wallet.png": "c7d6dbb2f786e37459d3999614195496",
"assets/assets/icons/milk.svg": "bafe00f2d7bbe6d90080a1f4d94b1fbe",
"assets/assets/icons/home.svg": "a8db484c3051ef0372ca21e6758a0c8f",
"assets/assets/icons/Group.png": "2df8c815e9ad0ff6a40983a296b10823",
"assets/assets/icons/Vector-1.png": "7dd40f3d596dbe6d9377c0d79d5dc9f5",
"assets/assets/icons/Vector-3.png": "a8c26b9a62682d4ec1b8a453c1417963",
"assets/assets/icons/Vector-2.png": "23381479875e9ec87d956858b21cf880",
"assets/assets/icons/Vector.png": "2dbac5c85d9ff99e52f8b819cf415653",
"assets/assets/icons/visa.png": "f5adc8818eb99f9d6e5a378395b453fd",
"assets/assets/icons/GooglePay.png": "ce49421794026e1b1d6053229d5b92a1",
"assets/assets/icons/coffee.svg": "7d7c1f05ac094e539bef07c07c00ecef",
"assets/assets/icons/search-normal.svg": "5541eb6a31bc6edd5a751e002d83ca8f",
"assets/assets/icons/card.svg": "5139c438dc4006ddb17c243a69473080",
"assets/assets/icons/sim.png": "2540fbc1bf7907335441ac3dc51d074c",
"assets/assets/icons/favorite.svg": "be12af158dfb08f23ed1fcc660391583",
"assets/assets/icons/apple.png": "48394875c859165d12fbcc208fb77d26",
"assets/assets/icons/Vector-10.png": "dd4649f4ce5817ba1c3fc44d6d9f6afc",
"assets/assets/icons/star.svg": "5506d24e1d95b4bb6d508dd3e54e78c7",
"assets/assets/icons/Vector-11.png": "0867fc7c22dd70d7be5b72c7db176e53",
"assets/assets/icons/Vector-13.png": "fd53331d04db588021290630e8268c1e",
"assets/assets/icons/Vector-12.png": "1f55102a65dac5942217c38d2a5380ce",
"assets/assets/icons/Group%252087.png": "d7f0d0bdcf0f89f9acc2b7e2efb10e28",
"assets/assets/icons/Group%252084.png": "42cac4defff4d3a9819f7642c9d23e43",
"assets/assets/icons/notifications.svg": "592794367b633d9630cfa446e85f0fed",
"assets/assets/icons/Vector-9.png": "9ec3a803805dc983f9b82ae44db5fd84",
"assets/assets/icons/amazon.png": "14b4b03cf0857d6cc703a4818ffdb288",
"assets/assets/icons/back.png": "3bbc9c43a6054c36a28c78c8b686fe4a",
"assets/assets/icons/Vector-8.png": "98814e7429e5949f8e5bfc9dbb4738e9",
"assets/assets/fonts/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/assets/fonts/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/assets/fonts/Poppins-SemiBold.ttf": "6f1520d107205975713ba09df778f93f",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
