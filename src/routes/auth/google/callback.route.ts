import { Static } from '@sinclair/typebox';
import { Type } from '@sinclair/typebox';
import { FastifyPluginAsync, RouteShorthandOptions } from 'fastify';

namespace TB {
  export const Body = Type.Object({
    access_token: Type.String(),
    expires_in: Type.Number(),
    refresh_token: Type.String(),
    scope: Type.String(),
    token_type: Type.String(),
  })

  export type BodyType = Static<typeof Body>
}

namespace Router {
  /** Config Options For Fastify Route */
  const options: RouteShorthandOptions = {
    schema: {
      body: TB.Body,
      response: { 200: TB.Response },
    },
  };

  export const route: FastifyPluginAsync = async(
    fastify,
    opts
  ): Promise<void> => {
    fastify.get("/callback", async function (req, res) {
      
    })
  }
}

export default Router.route