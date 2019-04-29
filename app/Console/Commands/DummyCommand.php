<?php

namespace App\Console\Commands;

use App\Models\FlatPart;
use App\Models\FlatType;
use Illuminate\Console\Command;

class DummyCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'dummy';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        FlatPart::query()->delete();

        FlatType::all()->each(function (FlatType $flatType) {
            $flatType->name = ['one', 'two', 'three', 'four', 'five'][$flatType->id-1].'-roomed flat';
            $flatType->save();

            $parts = ['entrance hall', 'kitchen', 'toilet'];

            for ($i = 1; $i <= $flatType->id; $i++) {
                $parts[] = 'room #'.$i;
            }

            shuffle($parts);

            foreach ($parts as $part) {
                $flatType->flatParts()->create([
                    'name' => $part,
                ]);
            }

        });
    }
}
