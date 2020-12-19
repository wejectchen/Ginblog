<template>
  <v-app app>
    <TopBar></TopBar>

    <v-main>
      <v-container></v-container>
    </v-main>

    <Footer></Footer>
  </v-app>
</template>

<script>
import TopBar from '../components/TopBar'
import Footer from '../components/Footer'
export default {
  components: { TopBar, Footer }
}
</script>
