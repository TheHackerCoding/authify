import { SERVER_URL } from '~/constants';
import fp from "fastify-plugin"
import fastifyOauth from "fastify-oauth2"

/**
 * This plugins implements fastify-oauth
 */

export default fp(async (fastify, _) => {
  // @ts-expect-error
  fastify.register(fastifyOauth, {
    name: 'google',
    scope: ['profile', 'email'],
    credentials: {
      client: {
        id: process.env.OAUTH_GOOGLE_ID,
        secret: process.env.OAUTH_GOOGLE_SECRET
      },
      auth: fastifyOauth.GOOGLE_CONFIGURATION
    },
    startRedirectPath: '/auth/google',
    callbackUri: `${SERVER_URL}/auth/google/callback`
  })
})
