<template>
  <div id="app">
    <canvas id="bg"></canvas>
    <main>
      <header>
        <h1>Анатолий митрошин</h1>
        <p>🚀 Привет человекь!</p>
      </header>


      <blockquote>
        <p>I like making stuff and putting it on the internet</p>
      </blockquote>

      <section>
        <h2>📜 Manifesto</h2>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        </p>

        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        </p>

        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        </p>

      </section>

      <section class="light">
        <h2>👩🏽‍🚀 Projects</h2>

        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        </p>

        <h2>🏆 Accomplishments</h2>

        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        </p>

      </section>

      <blockquote>
        <p>The best way out is always through <br>-Robert Frost</p>
      </blockquote>

      <section class="left">
        <h2>🌮 Work History</h2>

        <h3>McDonalds</h3>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        </p>
        <h3>Burger King</h3>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        </p>
        <h3>Taco Bell</h3>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        </p>

      </section>

      <blockquote>
        <p>Thanks for watching!</p>
      </blockquote>


    </main>
  </div>
</template>

<script>
import * as THREE from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls'
import {BoxGeometry} from "three";
export default {
  name: 'App',
  methods: {
    requireImage(path) {
      return require(path)
    },
    init() {
      window.scrollBy(0,200)


      //Сцена хранит в себе все объекты, которые будут рендариться
      const scene = new THREE.Scene();


      const camera = new THREE.PerspectiveCamera(
          75,
          window.innerWidth / window.innerHeight,
          0.1,
          1000
      );

      const renderer = new THREE.WebGLRenderer({
        canvas: document.querySelector('#bg')
      })

      renderer.setPixelRatio(window.devicePixelRatio);
      renderer.setSize(window.innerWidth, window.innerHeight);

      camera.position.setZ(30);

      renderer.render(scene, camera)

      const geometry = new THREE.TorusGeometry(10,3,16,100);
      const material = new THREE.MeshStandardMaterial({color: 0xFF6347})
      const torus = new THREE.Mesh(geometry, material)

      scene.add(torus);

      const pointLight = new THREE.PointLight(0xFFFFFF);
      pointLight.position.set(5,5,5)

      scene.add(pointLight)

      const ambientLight = new THREE.AmbientLight(0xFFFFFF)
      scene.add(pointLight,ambientLight)


      // const lightHelper = new THREE.PointLightHelper(pointLight)
      // const gridHelper = new THREE.GridHelper(200,50)

      const controls = new OrbitControls(camera, renderer.domElement)

      // scene.add(gridHelper)


      function addStar() {
        const geometry = new THREE.SphereGeometry(0.25,24,24)
        const material = new THREE.MeshStandardMaterial({color: 0xFFFFFF})
        const star = new THREE.Mesh(geometry,material)

        const [x,y,z] = Array(3).fill().map(() => THREE.MathUtils.randFloatSpread(100))

        star.position.set(x,y,z)
        scene.add(star)
      }


      Array(200).fill().forEach(addStar)


      const spaceTexture = new THREE.TextureLoader().load(require('@/assets/img/space.jpeg'))

      scene.background = spaceTexture;



      //Avatar

      const tolyaTexture = new THREE.TextureLoader().load(require('@/assets/img/me.jpg'));

      const tolya =  new THREE.Mesh(
          new BoxGeometry(3,3,3),
          new THREE.MeshBasicMaterial({map: tolyaTexture })
      )

      scene.add(tolya);



      //Moon

      const moonTexture = new THREE.TextureLoader().load(require('@/assets/img/moon.jpeg'));
      const normalMoonTexture = new THREE.TextureLoader().load(require('@/assets/img/normal.jpeg'));

      const moon = new THREE.Mesh(
          new THREE.SphereGeometry(3, 32,32),
          new THREE.MeshStandardMaterial(
              {
                map: moonTexture,
                normalMap: normalMoonTexture
              }
          )
      )
      moon.position.z = 30
      moon.position.setX(-10)

      scene.add(moon);

      tolya.position.z = -5;
      tolya.position.x = 2;


      function moveCamera() {
        const t = document.body.getBoundingClientRect().top;
        moon.rotation.x += 0.05;
        moon.rotation.y += 0.075;
        moon.rotation.z += 0.05;

        tolya.rotation.y += 0.01;
        tolya.rotation.z += 0.01;

        camera.position.z = t * -0.01;
        camera.position.x = t * -0.0002;
        camera.rotation.y = t * -0.0002;
      }

      document.body.onscroll = moveCamera;
      moveCamera();


      function animate() {
        requestAnimationFrame(animate)

        torus.rotation.x += 0.01;
        torus.rotation.y += 0.005;
        torus.rotation.z += 0.01;

        controls.update()
        renderer.render(scene,camera)
      }

      animate()

    }
  },
  mounted() {
    this.init();
  }
}
</script>

<style>
  canvas {
    position: fixed;
    top: 0;
    left: 0;
  }

  :root {
    --dark-bg: rgba(15, 15, 15, 0.95);
    --spacing: 350px;

    font-family: brandon-grotesque, sans-serif;
    font-weight: 400;
    font-style: normal;
  }


  main {
    width: 100vw;
    color: white;
    z-index: 99;
    position: absolute;
    width: 100%;
    margin: 0px auto;
    padding: 120px 0px;

    display: grid;
    grid-template-columns: repeat(12, 1fr);
  }

  h1, h2, h3, blockquote {
    font-family: elevon, sans-serif;
    font-weight: 700;
    font-style: normal;
  }

  canvas {
    position: fixed;
    top: 0;
    left: 0;
  }



  header {
    background: var(--dark-bg);
    grid-column: 2 / span 5;
    font-size: 2.5rem;
    padding: 2rem;
    margin-bottom: var(--spacing);
  }

  section {
    grid-column: 2 / 8;
    padding: 1rem;
    background: var(--dark-bg);
    font-size: 1.25rem;
    line-height: 1.5;
    margin-bottom: var(--spacing);
  }

  blockquote {
    margin: 0;
    padding: 0;
    grid-column: 2 / span 9;
    margin-bottom: var(--spacing);
  }

  blockquote p {
    color: black;
    background-color: white;
    font-size: 4rem;
    display: inline;
    line-height: 1;
  }

  .left {
    grid-column: 6 / 12;
  }

</style>
