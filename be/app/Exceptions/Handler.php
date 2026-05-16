<?php

namespace App\Exceptions;

use Throwable;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class Handler extends ExceptionHandler
{
    /**
     * The list of the inputs that are never flashed to the session on validation exceptions.
     *
     * @var array<int, string>
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     */
    public function register(): void
    {
        $this->renderable(function (NotFoundHttpException $e, $request) {
            if ($request->is('api/pasien/*')) {
                return response()->json([
                    'success' => false,
                    'message' => 'Data pasien tidak ditemukan.'
                ], 404);
            }
            if ($request->is('api/biodata/*')) {
                return response()->json([
                    'success' => false,
                    'message' => 'Data biodata tidak ditemukan.'
                ], 404);
            }
            if ($request->is('api/dokter/*')) {
                return response()->json([
                    'success' => false,
                    'message' => 'Data dokter tidak ditemukan.'
                ], 404);
            }
            // if ($request->is('api/covid19/*')) {
            //     return response()->json([
            //         'success' => false,
            //         'message' => 'Data pasien covid19 tidak ditemukan.'
            //     ], 404);
            // }
            if ($request->is('api/rekam-medis/*')) {
                return response()->json([
                    'success' => false,
                    'message' => 'Data rekam medis tidak ditemukan.'
                ], 404);
            }
            if ($request->is('api/hasil-lab/*')) {
                return response()->json([
                    'success' => false,
                    'message' => 'Data hasil lab tidak ditemukan.'
                ], 404);
            }
        });
    }
}
